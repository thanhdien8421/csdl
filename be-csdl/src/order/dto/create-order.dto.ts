import { IsDate, IsNumber, IsOptional, IsPositive, IsString } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateOrderDto {
  @IsDate()
  @Type(() => Date)
  orderDate?: Date;

  @IsDate()
  @IsString()
  paymentMethod: string;

  @IsOptional()
  @IsNumber()
  number: number[];

  @IsOptional()
  @IsNumber()
  @IsPositive()
  cost: number[];
}
