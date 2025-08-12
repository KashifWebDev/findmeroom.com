import { Moon, Sun } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { useTheme } from '@/hooks/useTheme';

export function ThemeToggle() {
  const { theme, toggleTheme } = useTheme();
  const Icon = theme === 'dark' ? Sun : Moon;
  return (
    <Button
      variant="ghost"
      size="icon"
      aria-label="Toggle dark mode"
      onClick={toggleTheme}
    >
      <Icon className="h-5 w-5" />
    </Button>
  );
}
