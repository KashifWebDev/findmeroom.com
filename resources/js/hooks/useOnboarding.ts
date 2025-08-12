import { useEffect, useState } from 'react';

export function useOnboarding(key: string, stepCount: number) {
  const storageKey = `onboarding:${key}`;
  const [active, setActive] = useState(false);
  const [step, setStep] = useState(0);

  useEffect(() => {
    const done = localStorage.getItem(storageKey);
    if (!done) {
      setActive(true);
    }
  }, [storageKey]);

  const next = () => {
    setStep((s) => {
      if (s + 1 >= stepCount) {
        localStorage.setItem(storageKey, '1');
        setActive(false);
        return s;
      }
      return s + 1;
    });
  };

  const skip = () => {
    localStorage.setItem(storageKey, '1');
    setActive(false);
  };

  const reset = () => {
    localStorage.removeItem(storageKey);
    setStep(0);
    setActive(true);
  };

  return { active, step, next, skip, reset } as const;
}
