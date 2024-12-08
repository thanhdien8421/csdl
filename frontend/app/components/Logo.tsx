import * as React from "react";
import { LogoProps } from "../../types";
import Image from "next/image";

export const Logo: React.FC<LogoProps> = ({ className = "", size = 74 }) => {
  return (
    <div className={`flex gap-10 items-center ${className}`}>
      <Image
        src="https://cdn.builder.io/api/v1/image/assets/TEMP/7fde03f11c6018343485ec14dfbbe3cc1d583cfa5210661cd30f98f085c0673e?placeholderIfAbsent=true&apiKey=2e91b678645640cfb9bdb9d816fad104"
        alt="Pizza Best Logo"
        width={size}
        height={size * 0.82}
        className="object-contain shrink-0"
        priority
      />
      <span className="grow shrink my-auto text-3xl">Pizza Best</span>
    </div>
  );
};