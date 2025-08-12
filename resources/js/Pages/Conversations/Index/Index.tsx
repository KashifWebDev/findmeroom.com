import React from 'react';
import Navbar from '@/Components/Navbar';
import Footer from '@/Components/Footer';
import ConversationList, { ConversationSummary } from '@/Components/ConversationList';
import OnboardingTour from '@/Components/OnboardingTour';

interface Props {
  items: ConversationSummary[];
}

const ConversationsIndex: React.FC<Props> = ({ items }) => (
  <div className="min-h-screen flex flex-col">
    <Navbar />
    <main className="flex-1 p-4">
      <ConversationList items={items} onSelect={() => {}} />
    </main>
    <Footer />
    <OnboardingTour id="conversations" steps={[<p>Open a chat</p>, <p>Send a message</p>, <p>Stay connected</p>]} />
  </div>
);

export default ConversationsIndex;
