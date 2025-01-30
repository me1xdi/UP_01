using Microsoft.VisualStudio.TestTools.UnitTesting;
using RepairRequests.Pages;
using System;
using System.Collections.Generic;
using System.Text;

namespace UnitTest1
{
    /// <summary>
    /// Сводное описание для UnitTest2
    /// </summary>
    [TestClass]
    public class UnitTest2
    {
        
        [TestMethod]
        public void TestMethod1()
        {
            bool l = AddRequestsPage.testDesc("fadsfsd");
            Assert.IsTrue(l);
           
        }
    }
}
