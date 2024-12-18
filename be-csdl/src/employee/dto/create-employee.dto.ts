import { IsDate, IsInt, IsNumber, IsOptional, IsPositive, IsString } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateEmployeeDto {
  @IsString()
  name: string;

  @IsOptional()
  @IsDate()
  @IsPositive()
  @Type(() => Date)
  birthday?: Date;

  @IsOptional()
  @IsNumber()
  @IsPositive()
  salary?: number;

  @IsOptional()
  @IsDate()
  @Type(() => Date)
  startDate?: Date;

  @IsOptional()
  @IsString()
  phone?: string;

  @IsOptional()
  @IsString()
  role?: string;

  @IsOptional()
  @IsInt()
  @IsPositive()
  dayOff?: number = 0;

  @IsOptional()
  @IsInt()
  @IsPositive()
  storeId?: number;

  // Các trường liên quan đến GetEmployeeFullInfo
  @IsOptional()
  @IsString()
  degree?: string; // Tương ứng với degree trong hàm SQL

  @IsOptional()
  @IsString()
  trainingTime?: string; // Tương ứng với trainingTime trong hàm SQL

  @IsOptional()
  @IsString()
  kinhNghiem?: string; // Tương ứng với kinhNghiem trong hàm SQL

  @IsOptional()
  @IsString()
  roleInCooking?: string; // Tương ứng với vaiTro trong hàm SQL
}
