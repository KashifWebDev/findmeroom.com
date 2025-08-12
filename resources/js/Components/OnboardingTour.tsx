import React from 'react';
import { useOnboarding } from '../hooks/useOnboarding';

interface Props {
  id: string;
  steps: React.ReactNode[];
}

const OnboardingTour: React.FC<Props> = ({ id, steps }) => {
  const { active, step, next, skip } = useOnboarding(id, steps.length);
  if (!active) return null;
  const isLast = step + 1 === steps.length;

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-40">
      <div className="bg-surface-0 p-6 rounded shadow max-w-sm w-full">
        <div className="mb-4">{steps[step]}</div>
        <div className="flex justify-end gap-2">
          <button onClick={skip} className="px-3 py-1 border rounded">
            Skip
          </button>
          <button onClick={next} className="px-3 py-1 bg-brand-primary text-white rounded">
            {isLast ? 'Done' : 'Next'}
          </button>
        </div>
      </div>
    </div>
  );
};

export default OnboardingTour;
