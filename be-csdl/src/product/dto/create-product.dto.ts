import { IsDate, IsString, IsOptional, IsNumber, IsPositive } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateProductDto {
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
  @IsNumber()
  @IsPositive()
  cost?: number;

  @IsOptional()
  @IsNumber()
  @IsPositive()
  price?: number;
}
