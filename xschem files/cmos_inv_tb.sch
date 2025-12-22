v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 1 -20 -150 {}
N -190 0 -190 20 {lab=VDD}
N -120 0 -120 20 {lab=Vin}
N -190 80 -190 110 {lab=GND}
N -120 80 -120 110 {lab=GND}
N 120 80 120 110 {lab=GND}
N 230 110 230 130 {lab=GND}
N 230 20 230 50 {lab=Vout}
C {cmos_inv.sym} 140 20 0 0 {name=x1}
C {vsource.sym} -190 50 0 0 {name=VDD value=1.8 savecurrent=false}
C {vsource.sym} -120 50 0 0 {name=Vin value="PULSE(0 1.8 0 .3n .3n 3n 6.6n)" savecurrent=false}
C {lab_pin.sym} 120 -40 1 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 50 20 0 0 {name=p2 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 230 20 2 0 {name=p4 sig_type=std_logic lab=Vout}
C {lab_pin.sym} -120 0 1 0 {name=p5 sig_type=std_logic lab=Vin}
C {lab_pin.sym} -190 0 1 0 {name=p6 sig_type=std_logic lab=VDD}
C {gnd.sym} -190 110 0 0 {name=l1 lab=GND}
C {gnd.sym} -120 110 0 0 {name=l2 lab=GND}
C {gnd.sym} 120 110 0 0 {name=l3 lab=GND}
C {code_shown.sym} -230 -170 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.dc Vin 0 1.8 1m
.tran 0.1n 10n
.save all
.end"}
C {capa.sym} 230 80 0 0 {name=C1
m=1
value=0.1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 230 130 0 0 {name=l4 lab=GND}
