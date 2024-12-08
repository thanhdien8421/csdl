import * as React from "react";
import { ButtonProps } from "../../types";

export const Button: React.FC<ButtonProps> = ({ 
  children, 
  onClick, 
  className = "" 
}) => {
  return (
    <button
      onClick={onClick}
      className={`transition-colors duration-200 hover:opacity-80 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-zinc-500 ${className}`}
      tabIndex={0}
      aria-label={typeof children === 'string' ? children : undefined}
    >
      {children}
    </button>
  );
};