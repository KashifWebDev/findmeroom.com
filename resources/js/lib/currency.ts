export const currencies = ['USD', 'EUR', 'GBP'] as const;

export function formatMinor(amount: number, currency: string) {
  return new Intl.NumberFormat(undefined, { style: 'currency', currency }).format(amount / 100);
}
