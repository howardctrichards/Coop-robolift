%%%  CALCULATIONS TO DETERMINE THE TRANSMISSION %%%

%% Definitions %%
clear
%The gears used here will be worm, spur and helix. See logbook.

%The transmission will have no more than one worm drive. See logbook.

%Reducing cost is more important than reducing the size (relative criteria
%sheet).

%mod: 0.5, 0.8, 1, 1.25, 1.5

%Limits on the number of teeth on a gear
wormMax = 120;
helicalMax = 10;
spurMax = 6;

%% Gear tables %%

%worm
wormTab = zeros(39,2,5); %pages 0.5 mod is page 1...
for i = 1:5
    wormTab(:,:,i) = xlsread('wormtable.xlsx',i);
end
%helical
helicalTab = zeros(67,2,2); %pages
for i = 1:2
    helicalTab(:,:,i) = xlsread('helicaltable.xlsx',i);
end

%% Variables that can be changed. %%
wormDiam = 0.012; %m
helicalEfficiency = 0.95;
%speed of the motor
motorSpeed = 4289; %rpm

%folder = 'testEff1/';

%% Main Script %%

mechanismSpeed = (6.64*60)/(2*pi); %rpm
mechanismTorque = 3.54; %Nm

wormTab = wormTab(:,:,1);%mod 0.5
helicalTab = helicalTab(:,:,1);

transmission.ratio = motorSpeed/mechanismSpeed; %calculate ratio
   
potentialGears = gearSelection(transmission.ratio,wormTab,helicalTab);   
potentialGears = efficiency(potentialGears,motorSpeed,wormDiam);   
potentialGears = sortrows(potentialGears,6);
%Potential gears are now sorted by cost.

%Adjust for the efficiency.
effCheap = potentialGears(1,7);
transmissionRatioAdj = transmission.ratio / effCheap;
   
potentialAdj = gearSelection(transmissionRatioAdj,wormTab,helicalTab);
potentialAdj = efficiency(potentialAdj,motorSpeed,wormDiam);   
potentialAdj = sortrows(potentialAdj,6);

%Potential gears sorted by cost and at an appropriate ratio for
%inefficiencies.

%% Remove repeats %% 

%% Gear stress calculations %%



%% Data Presentation %%

   
   
       
    
    

    