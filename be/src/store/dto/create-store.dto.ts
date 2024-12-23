import { IsDate, IsString, IsOptional, IsNumber, IsPositive } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateStoreDto {
  @IsString()
  name: string;

  @IsOptional()
  @IsString()
  address?: string;

  @IsOptional()
  @IsString()
  openTime?: string;

  @IsOptional()
  @IsString()
  closeTime?: string;

  @IsOptional()
  @IsNumber()
  @IsPositive()
  monitorStoreId?: number;

  @IsOptional()
  @IsNumber()
  @IsPositive()
  employeeListId?: number[];

  @IsOptional()
  @IsString()
  privatePhone?: string;

  @IsOptional()
  @IsString()
  hotline?: string;
}
