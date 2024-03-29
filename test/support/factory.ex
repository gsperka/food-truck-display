defmodule FoodTruck.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: FoodTruck.Repo

  def vendor_factory do
    %FoodTruck.Vendor{
      objectid: "735318",
      applicant: "Ziaurehman Amini",
      locationdescription: "MARKET ST: DRUMM ST intersection",
      address: "5 THE EMBARCADERO",
      schedule: "http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=15MFF-0159&ExportPDF=1&Filename=15MFF-0159_schedule.pdf",
      latitude: "37.794331003246846",
      longitude: "-122.39581105302317",
      blocklot: "0234017",
      permit: "15MFF-0159",
      status: "REQUESTED",
      facilitytype: "Push Cart",
      lot: "017"
    }
  end
end
