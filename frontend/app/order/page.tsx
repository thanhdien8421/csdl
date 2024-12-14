"use client"
import {Sidebar} from "./components/sidebar";
import BasicDemo from "./components/dataview";
const OrderPage = () => {
    return (    
        <div className="flex flex-row-reverse w-full gap-x-4">    
            <Sidebar></Sidebar>
            <div className="w-[80%]">
                <BasicDemo />
            </div>
        </div>
    );
}

export default OrderPage