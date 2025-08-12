import React, { useState } from 'react';
import Navbar from '@/Components/Navbar';
import Footer from '@/Components/Footer';
import { showToast } from '@/Components/ToastViewport';

interface Props {
  article: { title: string; body: string };
}

const AdminArticleEdit: React.FC<Props> = ({ article }) => {
  const [title, setTitle] = useState(article.title);
  const [body, setBody] = useState(article.body);

  const save = () => {
    showToast({ message: 'Article updated', type: 'success' });
  };

  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />
      <main className="flex-1 p-4 space-y-2">
        <input
          className="border p-2 w-full"
          placeholder="Title"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
        />
        <textarea
          className="border p-2 w-full h-40"
          placeholder="Body"
          value={body}
          onChange={(e) => setBody(e.target.value)}
        />
        <button onClick={save} className="px-4 py-2 bg-brand-primary text-white rounded">
          Save
        </button>
      </main>
      <Footer />
    </div>
  );
};

export default AdminArticleEdit;
