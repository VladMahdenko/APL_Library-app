class DownloaderController < ApplicationController

  def download_libraries_users_pdf
    send_data PdfGenerator.generate_libraries_users_pdf,
              filename: "Libraries_Users.pdf",
              type: "application/pdf"
  end

  def download_libraries_pdf
    send_data PdfGenerator.generate_libraries_pdf,
              filename: "Libraries.pdf",
              type: "application/pdf"
  end

  def download_users_pdf
    send_data PdfGenerator.generate_users_pdf,
              filename: "Users.pdf",
              type: "application/pdf"
  end

  def download_libraries_users_csv
    send_data CsvGenerator.generate_csv,
              filename: "Libraries_Users.csv",
              type: "application.csv"
  end
end