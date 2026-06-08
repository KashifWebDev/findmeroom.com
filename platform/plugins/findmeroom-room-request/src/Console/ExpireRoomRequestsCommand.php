<?php

namespace FindMeRoom\RoomRequest\Console;

use FindMeRoom\RoomRequest\Enums\RoomRequestStatusEnum;
use FindMeRoom\RoomRequest\Models\RoomRequest;
use Illuminate\Console\Command;
use Symfony\Component\Console\Attribute\AsCommand;

#[AsCommand('room-request:expire', 'Mark approved room requests as expired when past expires_at')]
class ExpireRoomRequestsCommand extends Command
{
    protected $signature = 'room-request:expire';

    protected $description = 'Set status=expired and is_public=false for approved requests past expires_at';

    public function handle(): int
    {
        $count = RoomRequest::query()
            ->where('status', RoomRequestStatusEnum::APPROVED)
            ->where(function ($query): void {
                $query
                    ->where('is_public', true)
                    ->orWhereNotNull('expires_at');
            })
            ->whereNotNull('expires_at')
            ->where('expires_at', '<', now())
            ->update([
                'status' => RoomRequestStatusEnum::EXPIRED,
                'is_public' => false,
            ]);

        $this->components->info(sprintf('Expired %d room request(s).', $count));

        return self::SUCCESS;
    }
}
