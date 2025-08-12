import type { PropsWithChildren } from 'react';
import Navbar from '../Components/Navbar';
import Footer from '../Components/Footer';
import ToastViewport from '../Components/ToastViewport';

export default function AppLayout({ children }: PropsWithChildren) {
  return (
    <>
      <a href="#main" className="sr-only focus:not-sr-only">
        Skip to content
      </a>
      <Navbar />
      <main id="main" className="min-h-screen">
        {children}
      </main>
      <Footer />
      <ToastViewport />
    </>
  );
}
