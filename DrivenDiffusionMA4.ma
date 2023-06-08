% Two species driven diffusion
% Author: Xiuping Wu
% Nov 26,2003
#include(DrivenDiffusion.inc)

[top]
components : DrivenDiffusion

[DrivenDiffusion]
type : cell
dim : (30,30)
delay : transport
defaultDelayTime  : 100
border : wrapped
neighbors : DrivenDiffusion(-1,-1) DrivenDiffusion(-1,0)  DrivenDiffusion(-1,1) DrivenDiffusion(0,-1)   
neighbors : DrivenDiffusion(0,0) DrivenDiffusion(0,1) DrivenDiffusion(1,-1) DrivenDiffusion(1,0)
neighbors : DrivenDiffusion(1,1) DrivenDiffusion(2,0) DrivenDiffusion(-2,0) DrivenDiffusion(0,2) DrivenDiffusion(0,-2)
initialvalue : 0
initialCellsValue : DrivenDiffusion4.val
localtransition : diffusion-rule

[diffusion-rule]
%If the particle is facing an occupied cell, then remains in that place and randomly chooses a direction to face
rule : {#macro(RandA)} 100 {( (0,0)=11 and (0,1)>0 or (0,0)=12 and (1,0)>0 or (0,0)=13 and (0,-1)>0 or (0,0)=14 and (-1,0)>0 )}
rule : {#macro(RandB)} 100 {( (0,0)=21 and (0,1)>0 or (0,0)=22 and (1,0)>0 or (0,0)=23 and (0,-1)>0 or (0,0)=24 and (-1,0)>0 )}

%If the particle is facing an empty cell that is faced by other particles, then remains in that place and chooses a direction
rule : {if ((0,0)>20, #macro(RandB),#macro(RandA)) } 100  { ((0,0)=21 or (0,0)=11)and (0,1)=0 and ( (1,1)=14 or (1,1)=24  or (0,2)=13 or (0,2)=23 or (-1,1)=12 or (-1,1)=22) 
                                          or ((0,0)=22 or (0,0)=12) and (1,0)=0 and ((2,0)=14 or (2,0)=24  or (1,1)=13 or (1,1)=23 or (1,-1)=11 or (1,-1)=21)      
                                          or ((0,0)=23 or (0,0)=13) and (0,-1)=0 and ((0,-2)=11 or (0,-2)=21 or (1,-1)=14 or (1,-1)=24 or (-1,-1)=12 or (-1,-1)=22)
                                          or ((0,0)=24 or (0,0)=14) and (-1,0)=0 and ((-1,-1)=11 or (-1,-1)=21  or (-1,1)=13 or (-1,1)=23 or (-2,0)=12 or (-2,0)=22)
                                          }

%If the particle is facing an empty cell that is faced by no other particles, then moves in and chooses a direction.  
rule : {if ((1,0)>20, #macro(RandB),#macro(RandA))} 100 { (0,0)=0 and ((1,0)=14 or (1,0)=24) and not((0,1)=13 or (0,1)=23 or (0,-1)=11 or (0,-1)=21 or (-1,0)=12 or (-1,0)=22)}
rule : {if ((0,1)>20, #macro(RandB),#macro(RandA))} 100 { (0,0)=0 and ((0,1)=13 or (0,1)=23) and not((1,0)=14 or (1,0)=24 or (0,-1)=11 or (0,-1)=21 or (-1,0)=12 or (-1,0)=22)}
rule : {if ((0,-1)>20, #macro(RandB),#macro(RandA))} 100 { (0,0)=0 and ((0,-1)=11 or (0,-1)=21) and not((1,0)=14 or (1,0)=24 or (0,1)=13 or (0,1)=23 or (-1,0)=12 or (-1,0)=22)}
rule : {if ((-1,0)>20, #macro(RandB),#macro(RandA))} 100 { (0,0)=0 and ((-1,0)=12 or (-1,0)=22) and not((1,0)=14 or (1,0)=24 or (0,-1)=11 or (0,-1)=21 or (0,1)=13 or (0,1)=23 )}

%If the cell occupied by a particle that can move, then this cell is vacated
rule : 0 100 { ((0,0)=14 or (0,0)=24) and (-1,0)=0 and not ((-1,-1)=11 or (-1,-1)=21 or (-2,0)=12 or (-2,0)=22 or (-1,1)=13 or (-1,1)=23)}
rule : 0 100 { ((0,0)=12 or (0,0)=22) and (1,0)=0 and not ((1,1)=13 or (1,1)=23 or (2,0)=14 or (2,0)=24 or (1,-1)=11 or (1,-1)=21)}
rule : 0 100 { ((0,0)=13 or (0,0)=23) and (0,-1)=0 and not ((1,-1)=14 or (1,-1)=24 or (0,-2)=11 or (0,-2)=21 or (-1,-1)=12 or (-1,-1)=22)}
rule : 0 100 { ((0,0)=11 or (0,0)=21) and (0,1)=0 and not ((1,1)=14 or (1,1)=24 or (0,2)=13 or (0,2)=23 or (-1,1)=12 or (-1,1)=22)}

%Whether the particle moves or not, choose a random direction to face
rule : {#macro(RandA)} 100 {(0,0)>0 and (0,0)<20}
rule : {#macro(RandB)} 100 {(0,0)>20}

%Otherwise, stay the same values
rule : { (0,0) } 100 { t }
