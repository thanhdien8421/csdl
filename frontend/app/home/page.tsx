"use client"
import {Sidebar} from "./components/Table/sidebar";
const HomePage = () => {
    return (
        <div className="flex flex-row-reverse w-full gap-x-4">
            <Sidebar></Sidebar>
            <div className="w-[80%]">
                
            </div>
        </div>
    );
}
export default HomePage;