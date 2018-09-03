/*1*/
select sum(salario), oficio from emple where deptno = (select deptno from depart where dnombre = 'VENTAS') group by oficio;
select sum(salario), oficio from emple natural join depart where dnombre = 'VENTAS' group by oficio;

/*2*/
select apellido from emple e where e.salario > (select avg(ee.salario) from emple ee) group by deptno, apellido;

/*3*/
select count(empno), dnombre from emple natural join depart where oficio = 'EMPLEADO' group by dnombre;

/*4*/
select dnombre from depart natural join emple where oficio = 'EMPLEADO'
        group by dnombre having count(empno) = (select max(count(empno)) from emple where oficio = 'EMPLEADO' group by deptno);
        
/*5*/
select deptno, dnombre from emple natural join depart where oficio = 'EMPLEADO'
        group by deptno, dnombre having count(empno) = (select max(count(empno)) from emple where oficio = 'EMPLEADO' group by deptno);
        
/*6*/
select dnombre, oficio from depart natural join emple group by oficio, dnombre having count(empno)>2;

/*7*/
(select nombre from nuevos INTERSECT select nombre from antiguos) UNION select nombre from alum;

/*9*/
select nombre from alum MINUS (select nombre from nuevos UNION select nombre from antiguos);

/*10*/
select count(apellidos),nombre, especialidad from profesores, centros where profesores.cod_centro(+)=centros.cod_centro group by nombre, especialidad;

/*11*/
select count(dni), nombre from personal, centros where personal.cod_centro(+)=centros.cod_centro group by nombre;

/*12*/
select especialidad from profesores group by especialidad having count(dni)=(select min(count(dni)) from profesores group by especialidad);

/*13*/
select nombre_banc "Nombre Banco", count(cod_sucur) "Nº Sucursales" from bancos natural join sucursales group by nombre_banc having count(cod_sucur)=(select max(count(cod_sucur)) from sucursales group by cod_banco);

/*14*/
select nombre_banc, saldo_debe, saldo_haber from bancos natural join cuentas where poblacion = 'GUADALAJARA' group by nombre_banc, saldo_debe, saldo_haber;

/*15*/
select nombre_cta, count(num_cta) from movimientos natural join cuentas group by nombre_cta having count(num_cta)=(select max(count(num_cta)) from movimientos group by num_cta); 

/*16*/
select nombre_suc, sum(importe) from sucursales natural join movimientos where tipo_mov = 'R' group by tipo_mov having sum(importe) = (select max(sum(importe)) from movimientos where tipo_mov = 'R' group by tipo_mov);
