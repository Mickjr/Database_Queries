insert into vehicleMake(make)(select distinct(make) from vehicle);

insert into vehicleModel(model)(select distinct(model) from vehicle);

insert into vehicleDrive(drive)(select distinct(drive) from vehicle);

insert into vehicleFuelType(vehicleFuelType)(select distinct(FuelType) from vehicle);create table `vehicleNormal` (  `vehicleId` int(11) not null auto_increment,  `makeId` int(11) default null,  `modelId` int(11) default null,  `year` int(11) default null,  `cylinders` int(11) default null,  `driveId` int(11) default null,  `mpgHighway` decimal(11,4) default null,  `mpgCity` decimal(11,4) default null,  `fueltypeId` int(11) default null,  primary key (`vehicleId`)) engine=InnoDB auto_increment=1 default charset=latin1;


insert into vehicleNormal (vehicleId, makeId, modelId, year, cylinders, driveId, mpgHighway, mpgCity, fueltypeid)(select vehicleId, make, model, year, cylinders, drive, mpgHighway, mpgCity, fueltypefrom vehiclejoin vehicleDrive on vehicle.drive = vehicleDrive.drivejoin vehicleFuelType on vehicle.fueltype = vehicleFuelType.fueltypejoin vehicleMake on vehicle.make = vehicleMake.makejoin vehicleModel on vehicle.model = vehicleModel.model);