import { Component, HostListener, ViewChild, ElementRef} from '@angular/core';


@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent {



  public sidebarHeight: any;
  public navPosition: any;

  @ViewChild("sidebar", {static:true})
    public sidebar!: ElementRef<HTMLDivElement>;

  ngOnInit() {
      this.navPosition = this.sidebar.nativeElement.offsetTop;
      this.sidebarHeight = window.innerHeight - this.navPosition -1;
  }
  

  @HostListener('window:resize', ['$event'])
  onWindowResize() {
    this.sidebarHeight = window.innerHeight - this.navPosition;
  }

  
}
