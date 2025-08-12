import React from 'react';

export interface Message {
  id: string;
  user: string;
  body: string;
  createdAt: string;
}

interface Props {
  messages: Message[];
}

const MessageThread: React.FC<Props> = ({ messages }) => (
  <div className="flex flex-col gap-2" role="log" aria-live="polite">
    {messages.map((m) => (
      <div key={m.id} className="p-2 rounded bg-surface-1">
        <div className="text-xs text-text-muted">{m.user}</div>
        <p>{m.body}</p>
      </div>
    ))}
  </div>
);

export default MessageThread;
