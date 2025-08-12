import AppLayout from '../../../Layouts/AppLayout';

export default function Index({ listingCount, unreadMessages }: { listingCount: number; unreadMessages: number }) {
  return (
    <AppLayout>
      <div className="p-4 space-y-4">
        <h1 className="text-2xl font-bold">My Dashboard</h1>
        <div className="grid gap-4 md:grid-cols-2">
          <div className="p-4 border rounded">Listings: {listingCount}</div>
          <div className="p-4 border rounded">Unread messages: {unreadMessages}</div>
        </div>
      </div>
    </AppLayout>
  );
}
