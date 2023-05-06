import { Component, ViewChild, ElementRef } from '@angular/core';


@Component({
  selector: 'app-schedule',
  templateUrl: './schedule.component.html',
  styleUrls: ['./schedule.component.css']
})
export class ScheduleComponent {
selected:Date= new Date;
fecha:Date = new Date

@ViewChild("date", {static:true})
    public date!: ElementRef<HTMLInputElement>;

ngOninit(){
console.log(this.fecha);
}
    
}
