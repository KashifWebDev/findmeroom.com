import React from 'react';

interface Props {
  title: string;
  action?: React.ReactNode;
}

const EmptyState: React.FC<Props> = ({ title, action }) => (
  <div className="p-8 text-center">
    <p className="mb-4">{title}</p>
    {action}
  </div>
);

export default EmptyState;
