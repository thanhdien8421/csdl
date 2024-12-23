"use client"
import {Sidebar} from "./components/sidebar";
import RevenuChart from "./components/chart";
const RevenuePage = () => {
    return (
        <div className="flex flex-row-reverse w-full gap-x-4">
            <Sidebar></Sidebar>
            <div className="w-[80%]">
                <RevenuChart/>
            </div>
        </div>
    );
}

export default RevenuePage
