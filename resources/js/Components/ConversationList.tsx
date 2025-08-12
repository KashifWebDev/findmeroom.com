import React from 'react';

export interface ConversationSummary {
  id: string;
  name: string;
  lastMessage: string;
  unread: number;
  updatedAt: string;
}

interface Props {
  items: ConversationSummary[];
  onSelect: (id: string) => void;
}

const ConversationList: React.FC<Props> = ({ items, onSelect }) => (
  <ul className="divide-y" role="list">
    {items.map((c) => (
      <li
        key={c.id}
        tabIndex={0}
        role="button"
        onClick={() => onSelect(c.id)}
        onKeyDown={(e) => e.key === 'Enter' && onSelect(c.id)}
        className="p-4 flex justify-between cursor-pointer focus:outline-none focus:ring"
      >
        <div>
          <p className="font-medium">{c.name}</p>
          <p className="text-xs text-text-muted truncate w-40">{c.lastMessage}</p>
        </div>
        <div className="text-xs text-text-muted text-right">
          {c.unread > 0 && <span className="text-brand-primary">{c.unread}</span>}
          <div>{c.updatedAt}</div>
        </div>
      </li>
    ))}
  </ul>
);

export default ConversationList;
