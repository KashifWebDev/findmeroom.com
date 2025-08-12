import React, { useState } from 'react';
import Navbar from '@/Components/Navbar';
import Footer from '@/Components/Footer';
import MessageThread, { Message } from '@/Components/MessageThread';
import MessageComposer from '@/Components/MessageComposer';
import { emitRealtime, useRealtime } from '@/hooks/useRealtime';

interface Props {
  conversationId: string;
  messages: Message[];
}

const ConversationShow: React.FC<Props> = ({ conversationId, messages: initial }) => {
  const [messages, setMessages] = useState<Message[]>(initial);

  useRealtime<Message>(`conversation:${conversationId}`, (m) =>
    setMessages((prev) => [...prev, m])
  );

  const send = (body: string) => {
    const msg: Message = {
      id: Date.now().toString(),
      user: 'me',
      body,
      createdAt: new Date().toISOString(),
    };
    setMessages((prev) => [...prev, msg]);
    emitRealtime(`conversation:${conversationId}`, msg);
  };

  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />
      <main className="flex-1 p-4 space-y-4">
        <MessageThread messages={messages} />
        <MessageComposer onSend={send} />
      </main>
      <Footer />
    </div>
  );
};

export default ConversationShow;
