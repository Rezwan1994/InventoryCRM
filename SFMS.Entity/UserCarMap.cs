﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFMS.Entity
{
    public class UserCarMap :Entity
    {
        public Guid UserId { get; set; }
        public Guid CarId { get; set; }
        public Guid Note { get; set; }
    }
}
