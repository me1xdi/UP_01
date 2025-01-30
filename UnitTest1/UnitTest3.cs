using Microsoft.VisualStudio.TestTools.UnitTesting;
using RepairRequests.Pages;
using System;
using System.Collections.Generic;
using System.Text;

namespace UnitTest1
{
    /// <summary>
    /// Сводное описание для UnitTest3
    /// </summary>
    [TestClass]
    public class UnitTest3
    {    
        [TestMethod]
        public void TestMethod1()
        {
            bool l = AddRequestsPage.testEquip("adf");
            Assert.IsTrue(l);
        }
    }
}
