using Microsoft.VisualStudio.TestTools.UnitTesting;
using RepairRequests.Pages;
using System;
using static RepairRequests.Pages.AddRequestsPage;
namespace UnitTest1
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            bool l = AddRequestsPage.testFio("adf");
            Assert.IsFalse(l);
        }
    }
}
