import { IsDate, IsInt, IsNumber, IsOptional, IsPositive, IsString } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateEmployeeDto {
  @IsString()
  name: string;

  @IsOptional()
  @IsNumber()
  @IsPositive()
  age?: number;

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
  role: string;

  @IsOptional()
  @IsInt()
  @IsPositive()
  dayOff?: number = 0;

  @IsOptional()
  @IsInt()
  @IsPositive()
  storeId: number;
}
