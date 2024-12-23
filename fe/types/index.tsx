export interface LogoProps {
    className?: string;
    size?: number;
  }
  
  export interface ImageProps {
    src: string;
    alt: string;
    className?: string;
    priority?: boolean;
  }
  export interface ButtonProps {
    children: React.ReactNode;
    onClick?: () => void;
    className?: string;
  }