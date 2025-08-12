import React from 'react';

const Footer: React.FC = () => (
  <footer className="p-4 text-center text-xs text-text-muted">
    © {new Date().getFullYear()} FindMeRoom
  </footer>
);

export default Footer;
