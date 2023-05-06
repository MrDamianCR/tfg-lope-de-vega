import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';

import { AppComponent } from './app.component';
import { SidebarComponent } from './Views/sidebar/sidebar.component';

import { DashboardComponent } from './Views/dashboard/dashboard.component';

import { TopbarComponent } from './Views/topbar/topbar.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { MatGridListModule } from '@angular/material/grid-list';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';

import { ScheduleComponent } from './schedule/schedule.component';
import { StatisticsComponent } from './statistics/statistics.component';
import { DatePickerComponent } from './date-picker/date-picker.component';
import { SettingComponent } from './setting/setting.component';
import { PerfilComponent } from './perfil/perfil.component';
import { ServiciosComponent } from './servicios/servicios.component';




@NgModule({
  declarations: [
    AppComponent,
    SidebarComponent,
    DashboardComponent,
    TopbarComponent,
    ScheduleComponent,
    StatisticsComponent,
    DatePickerComponent,
    SettingComponent,
    PerfilComponent,
    ServiciosComponent,
    
  ],
  imports: [
    BrowserModule,
    MatGridListModule,
    BrowserAnimationsModule,
    MatFormFieldModule,
    MatDatepickerModule,
    MatNativeDateModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
