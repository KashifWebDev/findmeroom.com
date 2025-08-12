import React, { useState } from 'react';

interface Props {
  onSend: (body: string) => void;
}

const MessageComposer: React.FC<Props> = ({ onSend }) => {
  const [body, setBody] = useState('');
  return (
    <form
      onSubmit={(e) => {
        e.preventDefault();
        if (body.trim()) {
          onSend(body);
          setBody('');
        }
      }}
      className="flex gap-2"
    >
      <textarea
        value={body}
        onChange={(e) => setBody(e.target.value)}
        rows={1}
        className="flex-1 border rounded p-2"
      />
      <button type="submit" className="px-4 py-2 bg-brand-primary text-white rounded">
        Send
      </button>
    </form>
  );
};

export default MessageComposer;
