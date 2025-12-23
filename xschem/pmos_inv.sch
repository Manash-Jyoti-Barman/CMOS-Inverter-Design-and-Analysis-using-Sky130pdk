v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 10 90 10 120 {lab=GND}
N 10 -10 10 30 {lab=Vin}
N -60 -40 -30 -40 {lab=Vin}
N 10 -90 10 -70 {lab=VCC}
N 10 -40 30 -40 {lab=VCC}
N 30 -80 30 -40 {lab=VCC}
N 10 -80 30 -80 {lab=VCC}
N 80 10 80 30 {lab=Vin}
N 80 90 80 110 {lab=GND}
N -340 60 -340 90 {lab=GND}
N -230 60 -230 90 {lab=GND}
N -340 -50 -340 -0 {lab=VCC}
N -230 -50 -230 -0 {lab=Vin}
N 10 10 80 10 {lab=Vin}
C {/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -10 -40 0 0 {name=M1
W=3.5
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {res.sym} 10 60 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 10 120 0 0 {name=l1 lab=GND}
C {capa.sym} 80 60 0 0 {name=C1
m=1
value=50f
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 80 110 0 0 {name=l2 lab=GND}
C {vsource.sym} -340 30 0 0 {name=VCC value=1.8 savecurrent=false}
C {vsource.sym} -230 30 0 0 {name=Vin value="PULSE(0 1.8 0 .3n .3n 3n 6.6n)" savecurrent=false}
C {gnd.sym} -340 90 0 0 {name=l3 lab=GND}
C {gnd.sym} -230 90 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -340 -50 1 0 {name=p4 sig_type=std_logic lab=VCC}
C {lab_pin.sym} -230 -50 1 0 {name=p5 sig_type=std_logic lab=Vin}
C {lab_pin.sym} -60 -40 0 0 {name=p1 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 10 -90 1 0 {name=p2 sig_type=std_logic lab=VCC}
C {lab_pin.sym} 80 10 2 0 {name=p3 sig_type=std_logic lab=Vout}
C {code_shown.sym} -440 -240 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.save all"}
C {code_shown.sym} -440 -170 0 0 {name=s2 only_toplevel=false value=".tran 0.1n 30n
.save all
.end"}
