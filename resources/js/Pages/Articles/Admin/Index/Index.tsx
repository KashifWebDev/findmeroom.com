import React from 'react';
import Navbar from '@/Components/Navbar';
import Footer from '@/Components/Footer';
import { ArticleSummary } from '@/Components/ArticleCard';

interface Props {
  items: ArticleSummary[];
}

const AdminArticlesIndex: React.FC<Props> = ({ items }) => (
  <div className="min-h-screen flex flex-col">
    <Navbar />
    <main className="flex-1 p-4">
      <div className="flex justify-end mb-4">
        <a href="/articles/admin/create" className="px-4 py-2 bg-brand-primary text-white rounded">
          New
        </a>
      </div>
      <ul className="space-y-2">
        {items.map((a) => (
          <li key={a.id}>
            <a href={`/articles/admin/edit/${a.id}`} className="text-brand-primary underline">
              {a.title}
            </a>
          </li>
        ))}
      </ul>
    </main>
    <Footer />
  </div>
);

export default AdminArticlesIndex;
