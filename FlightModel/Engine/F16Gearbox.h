#ifndef _F16GEARBOX_H_
#define _F16GEARBOX_H_

#include "ED_FM_Utility.h"		// Provided utility functions that were in the initial EFM example
#include "F16Constants.h"		// Common constants used throughout this DLL

/*
main engine is connected to gearbox which powers 
hydraulic pumps, fuel pumps and has some torque resistance on engine.

also JFS is connected to gearbox for rotating engine, especially during startup.
*/

class F16Gearbox
{
public:
	//double engineTorque;
	double engineRpm;

	//F16FuelPump *pFuelPump;
	//F16MainGenerator *pGenerator;
	//F16HydraulicSystem *pHydrPump;

public:
	F16Gearbox() 
		: engineRpm(0)
	{}
	~F16Gearbox() {}

	// update with engine/APU rpm/torque
	// and power consumption:
	// logic for EPU/JFS/main engine torque distribution
	// to various systems (hydraulics etc)
	void updateFrame(const double frameTime)
	{
		// APU (JFS) torque -> to engine for starting
		// without APU, engine -> auxiliary systems
		// airstart when engine rotating? (disconnect aux systems?)
		// reduction in rpm when windmilling -> limiting on airstart?

		/*
		if (engineTorque > threshold)
		{
			pAux->update(engineTorque, engineRpm)
		}
		**/
		/*
		// JFS will provide assistance to main engine in some cases
		// in addition to starting power
		if (engineTorque < threshold)
		{
			pJfs->update(pEngine)
		}
		*/

	}
};

#endif // ifndef _F16GEARBOX_H_

