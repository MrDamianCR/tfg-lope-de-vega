import { Component, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { SettingComponent } from './setting/setting.component';
import { PerfilComponent } from './perfil/perfil.component';
import { DashboardComponent } from './Views/dashboard/dashboard.component';
import { StatisticsComponent } from './statistics/statistics.component';
import { ServiciosComponent } from './servicios/servicios.component';

const routes: Routes = [
  {path: '', component: DashboardComponent},
  {path: 'perfil', component: PerfilComponent },
  {path: 'estadisticas', component: StatisticsComponent},
  {path:'servicios', component: ServiciosComponent}

   
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]

})
export class AppRoutingModule { }
