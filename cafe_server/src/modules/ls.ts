// import { Injectable } from '@nestjs/common';

// @Injectable()
// export class GeoService {
//   private readonly EARTH_RADIUS_METERS = 6371000; // Approx. radius of Earth in meters

//   getLatLonRange(lat: number, lon: number, radius: number = 50): { latMin: number, latMax: number, lonMin: number, lonMax: number } {
//     const degreeToMeter = 111320;
//     const latRange = radius / degreeToMeter;
//     const lonRange = radius / (degreeToMeter * Math.cos(this.degreesToRadians(lat)));

//     const latMin = lat - latRange;
//     const latMax = lat + latRange;
//     const lonMin = lon - lonRange;
//     const lonMax = lon + lonRange;

//     return {
//       latMin,
//       latMax,
//       lonMin,
//       lonMax,
//     };
//   }

//   private degreesToRadians(degrees: number): number {
//     return degrees * (Math.PI / 180);
//   }
// }


// import { Controller, Get, Query } from '@nestjs/common';
// import { GeoService } from './geo.service';

// @Controller('geo')
// export class GeoController {
//   constructor(private readonly geoService: GeoService) {}

//   @Get('range')
//   getLatLonRange(
//     @Query('lat') lat: number,
//     @Query('lon') lon: number,
//   ) {
//     const range = this.geoService.getLatLonRange(lat, lon);
//     return range;
//   }
// }



// GET /geo/range?lat=40.7128&lon=-74.0060