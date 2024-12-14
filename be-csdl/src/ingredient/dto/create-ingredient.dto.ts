import { IsDate, IsNumber, IsOptional, IsPositive, IsString } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateIngredientDto {
  @IsNumber()
  @IsPositive()
  storeId?: number;

  @IsString()
  name: string;

  @IsOptional()
  @IsString()
  type?: string;

  @IsOptional()
  @IsDate()
  @Type(() => Date)
  buyDate?: Date;

  @IsOptional()
  @IsDate()
  @Type(() => Date)
  endDate?: Date;

  @IsOptional()
  @IsNumber()
  number?: number;

  @IsOptional()
  @IsString()
  unit?: string;

  @IsOptional()
  @IsNumber()
  @IsPositive()
  cost?: number;

  @IsString()
  supplierName: string;
}
