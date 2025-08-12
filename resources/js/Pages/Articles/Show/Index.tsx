import React from 'react';
import Navbar from '@/Components/Navbar';
import Footer from '@/Components/Footer';
import RichContent from '@/Components/RichContent';

interface Props {
  article: { title: string; body: string };
}

const ArticleShow: React.FC<Props> = ({ article }) => (
  <div className="min-h-screen flex flex-col">
    <Navbar />
    <main className="flex-1 p-4">
      <h1 className="text-xl font-semibold mb-4">{article.title}</h1>
      <RichContent html={article.body} />
    </main>
    <Footer />
  </div>
);

export default ArticleShow;
