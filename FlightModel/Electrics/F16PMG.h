#ifndef _F16PMG_H_
#define _F16PMG_H_


#include "Electrics/AbstractElectricDevice.h"

/*
permanent magnetic generator

sources:
- NASA TP 2857

*/

namespace F16
{
	class F16PMG : public AbstractElectricDevice
	{
	public:
		F16PMG(void *_parentSystem) 
			: AbstractElectricDevice(_parentSystem)
		{}
		~F16PMG() {}

		void updateFrame(const double frameTime)
		{
		}

	};
}

#endif // ifndef _F16PMG_H_

