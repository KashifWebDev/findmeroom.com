import React from 'react';

interface Props {
  amount: number; // minor units
  currency: string;
}

const PriceCurrency: React.FC<Props> = ({ amount, currency }) => {
  const formatted = new Intl.NumberFormat(undefined, {
    style: 'currency',
    currency,
  }).format(amount / 100);
  return <span>{formatted}</span>;
};

export default PriceCurrency;
