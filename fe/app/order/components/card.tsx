"use client"
import {
    Card,
    CardContent,
    CardDescription,
    CardFooter,
    CardHeader,
    CardTitle,
  } from "@/components/ui/card"
  import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
  } from "@/components/ui/dialog";
import { any } from "zod";

export default function DataCard({ children, title, color } : { children: React.ReactNode, title : string, color : string}) {
    return (
      <Card className="h-[450px] w-[500px] pb-2 bg-white rounded-xl">
        <CardHeader className={`flex flex-row border-b rounded-t-xl bg-gradient-to-r ${color} py-4`}>
          <p className="text-3xl font-semibold font-serif text-white">{title}</p>
          {/* <Button className="ml-auto hover:scale-105 transition-transform duration-200 bg-white/20 hover:bg-white/30 backdrop-blur-sm border-0 w-8 h-8">
            <AddEducation data={data} onCheck={onCheck} />
          </Button> */}
        </CardHeader>
        <CardContent className="py-5 gap-1 h-3/4">
         <div className="flex flex-col overflow-y-auto gap-4 h-full pr-2">
          {children}
          </div>
        </CardContent>
      </Card>
    );
  }
