import React from 'react';

const Sidebar: React.FC<React.PropsWithChildren> = ({ children }) => (
  <aside className="w-64 bg-surface-1 p-4" aria-label="Sidebar">
    {children}
  </aside>
);

export default Sidebar;
