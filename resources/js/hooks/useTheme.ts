import React, { createContext, useCallback, useContext, useEffect, useState } from 'react';

export type Theme = 'light' | 'dark';

const ThemeContext = createContext<{ theme: Theme; toggleTheme: () => void }>({
  theme: 'light',
  toggleTheme: () => {},
});

const prefersDark = (): boolean => {
  if (typeof window === 'undefined') {
    return false;
  }
  return window.matchMedia('(prefers-color-scheme: dark)').matches;
};

export function initializeTheme() {
  const stored = (typeof localStorage !== 'undefined' && (localStorage.getItem('theme') as Theme | null)) || null;
  const theme: Theme = stored || (prefersDark() ? 'dark' : 'light');
  if (typeof document !== 'undefined') {
    document.documentElement.classList.toggle('dark', theme === 'dark');
  }
}

function useThemeInternal() {
  const [theme, setTheme] = useState<Theme>('light');

  useEffect(() => {
    const stored = (localStorage.getItem('theme') as Theme | null) || (prefersDark() ? 'dark' : 'light');
    setTheme(stored);
    document.documentElement.classList.toggle('dark', stored === 'dark');
  }, []);

  const toggleTheme = useCallback(() => {
    setTheme((prev) => {
      const next: Theme = prev === 'dark' ? 'light' : 'dark';
      document.documentElement.classList.toggle('dark', next === 'dark');
      localStorage.setItem('theme', next);
      return next;
    });
  }, []);

  return { theme, toggleTheme } as const;
}

export const ThemeProvider: React.FC<React.PropsWithChildren> = ({ children }) => {
  const value = useThemeInternal();
  return React.createElement(ThemeContext.Provider, { value }, children);
};

export function useTheme() {
  return useContext(ThemeContext);
}
