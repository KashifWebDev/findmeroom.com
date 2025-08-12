import type { PropsWithChildren } from 'react';
import Navbar from '../Components/Navbar';

export default function AdminLayout({ children }: PropsWithChildren) {
  return (
    <div className="min-h-screen flex">
      <aside className="w-64 p-4 border-r">Admin</aside>
      <div className="flex-1">
        <Navbar />
        <main className="p-4" id="main">
          {children}
        </main>
      </div>
    </div>
  );
}
