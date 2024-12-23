import { IsDate, IsNumber, IsOptional, IsPositive, IsString } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateOrderDto {
  @IsNumber()
  salerId: number;

  @IsNumber()
  storeId: number;

  @IsString()
  paymentMethod: string;

  @IsString()
  productIds: string;

  @IsString()
  quantities: string;

  
}
