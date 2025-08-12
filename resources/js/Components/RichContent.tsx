import React from 'react';

interface Props {
  html: string;
}

const RichContent: React.FC<Props> = ({ html }) => (
  <div
    className="prose dark:prose-invert max-w-none"
    dangerouslySetInnerHTML={{ __html: html }}
  />
);

export default RichContent;
