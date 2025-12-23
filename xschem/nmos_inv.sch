v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 100 90 140 90 {lab=Vin}
N 180 20 180 60 {lab=Vout}
N 180 120 180 140 {lab=GND}
N 180 -60 180 -40 {lab=VCC}
N 180 90 210 90 {lab=GND}
N 210 90 210 130 {lab=GND}
N 180 130 210 130 {lab=GND}
N -250 120 -250 140 {lab=GND}
N -180 120 -180 140 {lab=GND}
N -180 40 -180 60 {lab=Vin}
N -250 40 -250 60 {lab=VCC}
N 300 40 300 70 {lab=Vout}
N 180 40 300 40 {lab=Vout}
N 300 130 300 150 {lab=GND}
C {/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} 160 90 0 0 {name=M1
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {res.sym} 180 -10 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 180 140 0 0 {name=l1 lab=GND}
C {vsource.sym} -180 90 0 0 {name=Vin value="pulse(0 1.8 0 .3n .3n 3n 6.6n)" savecurrent=false}
C {vsource.sym} -250 90 0 0 {name=VCC value=1.8 savecurrent=false}
C {gnd.sym} -250 140 0 0 {name=l2 lab=GND}
C {gnd.sym} -180 140 0 0 {name=l3 lab=GND}
C {code_shown.sym} -300 -190 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.save all"}
C {code_shown.sym} -300 -120 0 0 {name=s2 only_toplevel=false value=".tran 0.1n 30n
.save all
.end"}
C {capa.sym} 300 100 0 0 {name=C1
m=1
value=50f
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 300 150 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 100 90 0 0 {name=p6 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 180 -60 1 0 {name=p1 sig_type=std_logic lab=VCC}
C {lab_pin.sym} 300 40 2 0 {name=p2 sig_type=std_logic lab=Vout}
C {lab_pin.sym} -250 40 1 0 {name=p3 sig_type=std_logic lab=VCC}
C {lab_pin.sym} -180 40 1 0 {name=p4 sig_type=std_logic lab=Vin}
